From: Andrew Beverley <andy@andybev.com>
Subject: PortalShaper - details of scripts for a captive portal and traffic
 shaper
Date: Tue, 22 Nov 2011 22:09:17 +0000
Message-ID: <1321999757.2382.2523.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1321999769;
	bh=Q5JZ3HwotxxKumdPoYd25YXlhDaa9ee11St+6hXDD5c=;
	h=Subject:From:To:Content-Type:Date:Message-ID:Mime-Version:
	 Content-Transfer-Encoding;
	b=Jqrl0kVoMYBqib5K1njuUUyhW973U/c1N89lH5wKrnyHgd1Zscyiis+mAmXwQbOUZ
	 0BGZOvioRfC0q07vO/PqhzBr7KnnkTYvfmT2VaYobpKwlFZtt4pXJZ3kQImrc1JcPZ
	 +AgFGyCcTW+IlK9yE/Righj9T3hEOhaohDFYq5aA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I'm posting this for people's interest, in case it is of use to anybody.

I have created a set of scripts (called PortalShaper) to do the
following:

  * Act as a captive portal
  * Manage the users on the captive portal
  * Traffic shape the internet connection to optimise its speed
  * Create a "splash page" to display adverts to users
  * Load-share between multiple connections

I won't go into any details in this email, except to say that all the
above is achieved with iptables and iproute2 rules, with PHP scripts for
the captive portal web pages. It's therefore easily customised, or used
as examples.

The details of how it works are contained at:

http://andybev.com/index.php/PortalShaper

Full installation instructions for installing from scratch are contained
at:

http://andybev.com/index.php/Setting_up_a_captive_portal_from_scratch_using_Debian

If you have any comments then please let me know.

Andy


