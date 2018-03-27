package fishlikewater;


import freemarker.ext.beans.BeansWrapperBuilder;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.*;
import java.util.Locale;
import java.util.Map;

public class ParseTpl {
    private static Configuration config;
    public static void parseSqlTemplate(String inFile, String outFile, String templatePath, Map paramMap) {

        Configuration cfg = getConfiguration();
        try {
            File file = new File(outFile);
            File parentFile = file.getParentFile();
            if(!parentFile.exists()){
                parentFile.mkdirs();
            }
            Writer stringWriter=new OutputStreamWriter(new FileOutputStream(file), "gbk");
            cfg.setDirectoryForTemplateLoading(new File(templatePath));
            //String disableNumberParserStr = "<#setting number_format=\"#\">";
            Template t = cfg.getTemplate(inFile);
            t.process(paramMap, stringWriter);
        } catch (Exception e) {
            throw new RuntimeException("Get the exception of the expression content", e);
        }
    }

    private static Configuration getConfiguration() {
        if (config == null) {
            Configuration cfg = new Configuration(Configuration.VERSION_2_3_26);
            cfg.setObjectWrapper((new BeansWrapperBuilder(Configuration.VERSION_2_3_26)).build());
            cfg.setEncoding(Locale.getDefault(), "GBK");
            cfg.setNumberFormat("#");
            config = cfg;
        }
        return config;
    }
}
