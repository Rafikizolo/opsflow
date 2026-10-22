package workorder;

import java.util.Objects;

public class WorkOrder
{
    Long id;
    private String title;
    private String description;
    private String priority;
    private String status;


    public WorkOrder (Long id, String title, String description, String priority, String status)
    {
        this.id = id;
        this.title = title;
        this.description = description;
        this.priority = priority;
        this. status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof WorkOrder workOrder)) return false;
        return Objects.equals(id, workOrder.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}
