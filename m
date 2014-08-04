From: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Subject: FwGuardian 5.0
Date: Mon, 4 Aug 2014 07:17:38 -0400
Message-ID: <CACuyg25CshM-dtYfM7P6NoYSOUUY_xkWMw_GerCewiTpgtjT6w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=05IOhk1XbJJP+KE3491Hzb8ahr+q5PlrF8p0WnQMyHc=;
        b=TwB3+la+Y8WxtxhBl4W25cBI6b7RHvuXWKOsthZUSZZVhkLc0ymfVyrQKRSsRVScvf
         bsBftBP85IplQ+VBlXgSAb4Cl6l2COKQBlVK3c4gNT4D5HUHc3xE9I0UfYiVqNsYqHdQ
         DUresb6iqAlf/oTRDEZw9H5Epr0FalCrCHC3nCPM9zqD15BKsbCvnfUrWyWi1/Aip+To
         B3eIYtc9ehxNqKi74Vv/SR9rdPhtk2Pa2poazytH5Ds8DMVRX2wq3IXsqVKuG8pN9kr3
         aZBB/318JyGyhJgek4XlJ/R2kGzUr0OYYcb92OvqZ7GFN9/ENO65K1hxsAjQJJhrkMpv
         pXBg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Like to share the new version of my firewall script - fwguardian 5.0
Many features have been incorporated and the web interface has been improved.

http://sourceforge.net/projects/humbertolj/

1. New extension support (profile option)
- You can find anti-ddos examples into /opt/fw5.0/profile/profile.def
(Examples are tested and working in production environments)

- You can add SYNPROXY, GeoIP, IPP2P support in a easy way (debian/ubuntu):
/opt/fw5.0/modules/tools/apps/xtables-addons.sh

- I used this script to protect our routers from constant DDoS
attacks. I made a bridge-firewall configuration, with geoip, SYNPROXY
and integrated with Suricata IPS. It worked perfectly.


2. Dynamic blacklist with simpleips module - lasting 6 hours.
/opt/fw5.0/fwguardian --enable simpleips

- Edit the "/opt/fw5.0/securityaddon/config" to user-agent triggers.
The logic of this module was based on the Ninja firewall.

- Edit the "/opt/fw5.0/fwguardian.conf" and configure IFWAN (monitored
interfaces).


3. Scripts to Suricata IPS and Kibana dashboard:
/opt/fw5.0/modules/tools/ips/


4. New dgd (dead-gateway-detection) bugfix and changes


5. More flexible Web interface with ajax and rrd support
