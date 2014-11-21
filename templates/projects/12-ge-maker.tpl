{$PAGE_TITLE="GE Centricity RIS-IC @wizcabbit"}
{$PAGE_KEYWORDS="GE,RIS,template,medical,work flow"}
{$NAV="projects"}
{$PROJ="12"}

{include file="header.tpl"}

{include file="projects/proj-sidebar.tpl"}

<div id="proj-detail">
  <div id="proj-attribute">
    <h5>Client</h5>
    <span><a href="//www3.gehealthcare.com/en">GE Healthcare</a></span>
    <h5>Product Home</h5>
    <span><a href="//www3.gehealthcare.com/en/products/categories/healthcare_it/medical_imaging_informatics_-_ris-pacs-cvis/centricity_ris-ic">Centricity RIS-IC</a></span>
    <h5>Time</h5>
    <span>2012</span>
    <h5>My Role in Product</h5>
    <span>Template Maker Engineer</span>
    <h5>Skills & Technologys</h5>
    <span>.NET Framework</span>
    <span>C#</span>
    <span>WPF</span>
    <span>XAML</span>
    <span>MVVM</span>
    <h5>Tools</h5>
    <span>Blend (Front-end)</span>
    <span>Visual Studio (Dev)</span>
    <h5>Deliverables</h5>
    <span>Medical workflow template maker</span>
  </div>
  <div id="proj-intro">
    <h2>Centricity RIS-IC</h2>
    <p>This product is a web-based radiology information system designed for evolving clinical and business needs through an enterprise-wide and patient-centric view of workflows.</p>
    <span class="proj-highlight">There are thousands kinds of medical works flow and templates in hospital, people needs a mordern way to use it, like using theme of their blog.</span>

    <h4>Paperless Workflow</h4>
    <img src="{$WEB_ROOT}/images/proj_12_struct.jpg" alt="GE Maker">
    <p>RIS-IC is a very big system contains software, hardware, midware and so many components. Our team developed the template maker for paperless workflow.</p>
    <p>The paperless Workflow can improve workflow, preserve data integrity and boost productivity. Reducing paper can save time, money and reduce the need for facility storage space. Centricity Paperless Workflow embedded with RIS-IC not only takes the paper out of the workflow, but makes information accessible when and where it’s needed ― only a click away.</p>

    <h4>Report Template Maker</h4>
    <p>A report template is a file that describes the layout for the data as well as contains some decorations for the report. In other words, report template basically describes how the data is organized inside the report.</p>
    <p>So we need a template maker to help doctors us GUI to build their customized report. Our template maker look like a mini-IDE for doctor. It has both preview mode for doctors and code mode for IT administrators.</p>
    <img src="{$WEB_ROOT}/images/proj_12_ui.jpg" alt="Template Maker">


    <h4>My Contribution</h4>
    <p>The project's team has 2 engineer and 1 UI designer, I implements almost all cods of template maker.</p>
    <ul class="proj-list">
      <li>MVVM mode in WPF implements;</li>
      <li>Commands system, and its Undo-Redo architecture;</li>
      <li>XAML - UI Elements 2-side transformation.</li>
    </ul>
  </div>

</div>

{include file="footer.tpl"}
