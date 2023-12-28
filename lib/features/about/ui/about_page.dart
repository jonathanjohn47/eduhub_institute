import 'package:eduhub_institute/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("About Us",
                    style: TextStyle(
                        fontSize: 3.h,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1.dp,
                  width: 25.w,
                  color: AppColors.primary,
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Html(
                data:
                    """<div data-particle_enable="false" data-particle-mobile-disabled="false" class="elementor-element elementor-element-16eb015e e-flex e-con-boxed e-con e-child" data-id="16eb015e" data-element_type="container" data-settings="{&quot;content_width&quot;:&quot;boxed&quot;}">
					<div class="e-con-inner">
				<div class="elementor-element elementor-element-32b9d2aa elementor-widget elementor-widget-text-editor" data-id="32b9d2aa" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
			<style>/*! elementor - v3.18.0 - 20-12-2023 */
.elementor-widget-text-editor.elementor-drop-cap-view-stacked .elementor-drop-cap{background-color:#69727d;color:#fff}.elementor-widget-text-editor.elementor-drop-cap-view-framed .elementor-drop-cap{color:#69727d;border:3px solid;background-color:transparent}.elementor-widget-text-editor:not(.elementor-drop-cap-view-default) .elementor-drop-cap{margin-top:8px}.elementor-widget-text-editor:not(.elementor-drop-cap-view-default) .elementor-drop-cap-letter{width:1em;height:1em}.elementor-widget-text-editor .elementor-drop-cap{float:left;text-align:center;line-height:1;font-size:50px}.elementor-widget-text-editor .elementor-drop-cap-letter{display:inline-block}</style>				<p>At Edu Hub Institutes, we are dedicated to providing quality education and fostering an environment that nurtures intellectual and personal growth. Our institute, located in the heart of Jammu, is committed to offering comprehensive educational programs designed to empower students and prepare them for the challenges of the modern world.</p><p><strong>Our Mission</strong></p><p>Our mission is to cultivate a learning community that encourages critical thinking, creativity, and innovation. We strive to equip our students with the knowledge, skills, and values necessary to excel in their academic pursuits and beyond.</p><p><strong>Educational Philosophy</strong></p><p>At Edu Hub Institutes, we believe in a holistic approach to education. We emphasize not only academic excellence but also the development of character, leadership qualities, and a sense of social responsibility.</p><p><strong>Our Offerings</strong></p><p>We offer a diverse range of educational programs and courses tailored to meet the individual needs of our students. Our experienced faculty members are dedicated to providing a supportive and enriching learning environment.</p><p><strong>Community Engagement</strong></p><p>We are actively involved in community initiatives and aim to contribute positively to society. Through various outreach programs and partnerships, we seek to make a meaningful impact beyond the confines of our institute.</p><p><strong>Contact Us</strong></p><p>If you have any inquiries or would like to know more about Edu Hub Institutes, please feel free to reach out to us at <a href="mailto:eduhubjammu@gmail.com" target="_new">eduhubjammu@gmail.com</a>. We welcome the opportunity to connect with you.</p>						</div>
				</div>
					</div>
				</div>"""),
          ],
        ),
      ),
    );
  }
}
