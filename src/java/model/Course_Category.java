/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author yeuda
 */
public class Course_Category {

    private int categoryId;
    private int courseId;

    public Course_Category(int categoryId, int courseId) {
        this.categoryId = categoryId;
        this.courseId = courseId;
    }

    public Course_Category() {
    }

    public int getCategoryId() {
        return categoryId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    @Override
    public String toString() {
        return "Course_Category{" + "categoryId=" + categoryId + ", courseId=" + courseId + '}';
    }
    
    
}
