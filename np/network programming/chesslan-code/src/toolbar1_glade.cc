// generated 2006/10/14 15:24:37 EDT by luigi@tuxy.(none)
// using glademm V2.6.0
//
// DO NOT EDIT THIS FILE ! It was created using
// glade-- chesslan.glade
// for gtk 2.10.6 and gtkmm 2.10.2
//
// Please modify the corresponding derived classes in ./src/toolbar1.cc


#if defined __GNUC__ && __GNUC__ < 3
#error This program will crash if compiled with g++ 2.x
// see the dynamic_cast bug in the gtkmm FAQ
#endif //
#include "config.h"
/*
 * Standard gettext macros.
 */
#ifdef ENABLE_NLS
#  include <libintl.h>
#  undef _
#  define _(String) dgettext (GETTEXT_PACKAGE, String)
#  ifdef gettext_noop
#    define N_(String) gettext_noop (String)
#  else
#    define N_(String) (String)
#  endif
#else
#  define textdomain(String) (String)
#  define gettext(String) (String)
#  define dgettext(Domain,Message) (Message)
#  define dcgettext(Domain,Message,Type) (Message)
#  define bindtextdomain(Domain,Directory) (Domain)
#  define _(String) (String)
#  define N_(String) (String)
#endif
#include <gtkmmconfig.h>
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
#include <sigc++/compatibility.h>
#define GMM_GTKMM_22_24(a,b) b
#else //gtkmm 2.2
#define GMM_GTKMM_22_24(a,b) a
#endif //
#include "toolbar1_glade.hh"
#include <gtkmm/image.h>
#include <gtkmm/stockid.h>

toolbar1_glade::toolbar1_glade(GlademmData *gmm_data
) : Gtk::Toolbar()
{  toolbar1 = this;
   
   Gtk::Image *bback1_img = Gtk::manage(new class Gtk::Image(Gtk::StockID("gtk-goto-first"), Gtk::IconSize(3)));
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   bback1 = Gtk::manage(new class Gtk::ToolButton(*bback1_img, _("")));
#endif //
   
   Gtk::Image *back1_img = Gtk::manage(new class Gtk::Image(Gtk::StockID("gtk-go-back"), Gtk::IconSize(3)));
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   back1 = Gtk::manage(new class Gtk::ToolButton(*back1_img, _("")));
#endif //
   
   Gtk::Image *forward1_img = Gtk::manage(new class Gtk::Image(Gtk::StockID("gtk-go-forward"), Gtk::IconSize(3)));
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   forward1 = Gtk::manage(new class Gtk::ToolButton(*forward1_img, _("")));
#endif //
   
   Gtk::Image *fforward1_img = Gtk::manage(new class Gtk::Image(Gtk::StockID("gtk-goto-last"), Gtk::IconSize(3)));
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   fforward1 = Gtk::manage(new class Gtk::ToolButton(*fforward1_img, _("")));
#endif //
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   toolbar1->append(*bback1);
#else //
   
   
   toolbar1->tools().push_back(Gtk::Toolbar_Helpers::ButtonElem(_(""), *bback1_img, Gtk::Toolbar_Helpers::Callback0()));
   bback1 = static_cast<Gtk::Button *>(toolbar1->tools().back().get_widget());
#endif //
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   toolbar1->append(*back1);
#else //
   
   
   toolbar1->tools().push_back(Gtk::Toolbar_Helpers::ButtonElem(_(""), *back1_img, Gtk::Toolbar_Helpers::Callback0()));
   back1 = static_cast<Gtk::Button *>(toolbar1->tools().back().get_widget());
#endif //
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   toolbar1->append(*forward1);
#else //
   
   
   toolbar1->tools().push_back(Gtk::Toolbar_Helpers::ButtonElem(_(""), *forward1_img, Gtk::Toolbar_Helpers::Callback0()));
   forward1 = static_cast<Gtk::Button *>(toolbar1->tools().back().get_widget());
#endif //
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   toolbar1->append(*fforward1);
#else //
   
   
   toolbar1->tools().push_back(Gtk::Toolbar_Helpers::ButtonElem(_(""), *fforward1_img, Gtk::Toolbar_Helpers::Callback0()));
   fforward1 = static_cast<Gtk::Button *>(toolbar1->tools().back().get_widget());
#endif //
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   _tooltips.set_tip(*bback1, _("Move to beginning"), "");
   bback1->set_visible_horizontal(true);
   bback1->set_visible_vertical(true);
   bback1->set_is_important(false);
   bback1->set_tooltip(_tooltips, _("Move to beginning"));
#endif //
   bback1_img->show();
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   _tooltips.set_tip(*back1, _("Step back "), "");
   back1->set_visible_horizontal(true);
   back1->set_visible_vertical(true);
   back1->set_is_important(false);
   back1->set_tooltip(_tooltips, _("Step back "));
#endif //
   back1_img->show();
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   _tooltips.set_tip(*forward1, _("Step forward"), "");
   forward1->set_visible_horizontal(true);
   forward1->set_visible_vertical(true);
   forward1->set_is_important(false);
   forward1->set_tooltip(_tooltips, _("Step forward"));
#endif //
   forward1_img->show();
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   _tooltips.set_tip(*fforward1, _("Move to end"), "");
   fforward1->set_visible_horizontal(true);
   fforward1->set_visible_vertical(true);
   fforward1->set_is_important(false);
   fforward1->set_tooltip(_tooltips, _("Move to end"));
#endif //
   fforward1_img->show();
   toolbar1->set_size_request(138,-1);
   toolbar1->set_border_width(1);
   toolbar1->set_tooltips(true);
   toolbar1->set_toolbar_style(Gtk::TOOLBAR_ICONS);
   toolbar1->set_orientation(Gtk::ORIENTATION_HORIZONTAL);
#if GTKMM_MAJOR_VERSION==2 && GTKMM_MINOR_VERSION>2
   toolbar1->set_show_arrow(true);
#endif //
   bback1->show();
   back1->show();
   forward1->show();
   fforward1->show();
   toolbar1->show();
}

toolbar1_glade::~toolbar1_glade()
{  
}