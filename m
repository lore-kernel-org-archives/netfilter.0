From: "Phil Leinhauser" <phil@teqknow.com>
Subject: Strange ipfilter happenings
Date: Wed, 26 Dec 2007 16:50:32 -0500
Message-ID: <37cc9b7a236ffeb8ed42521651430571@teqknow.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

 I have an FC6 install that is running Qmailtoaster. The QMT install made sure all firewalls were off and installed IPtables and put in a default config. Linux firewall and SElinux are both off.

To do some remote admin so I installed Webmin which uses ports 10000 and 20000. So far so good. Everything works fine. Until...

I installed Splunk to have a human readable set of logs. This uses port 8000. I used Webmin to add the port. I activate the new config and everything is happy. Until... About 15 minutes or so, the iptables config reverts back to some older config! I checked the /etc/sysconfig/iptables and the correct config with 8000 is there but if I do iptables -L -n and port 8000 is NOT in the list. If I do an iptables restart then look at iptables -L -n the port is back! Just for grins, I manually added a few random ports into the config file and the same thing happens, they are active for a little while but then the running config reverts to an older version.

Where is it getting the older config from and what mechanism is flushing this? Is there some security piece that resets iptables? I have since tried to turn off Webmin and Splunk but still, after a few minutes, iptables reverts to an older config. I have no idea where it is getting it from. I have also done an iptables-save and it appears to save the config with no errors but the iptables config file date stamp never changes.  Where or what is it saving?

I've been playing with this for weeks now and am no closer to an answer. I even uninstalled and reinstalled iptables. I'm lost...

Thanks
Phil
