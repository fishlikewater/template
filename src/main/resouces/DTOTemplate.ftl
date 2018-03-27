package ${package}.dto;

import lombok.Data;
import scorpio.annotation.Id;
import scorpio.core.BaseObject;

@Data
public class ${className}DTO extends BaseObject {

    <#if id??>
    @Id
    private ${id};

    </#if>
    <#list list as p>
    private ${p};

    </#list>

}