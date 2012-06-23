From: Alan Jenkins <alan.christopher.jenkins@gmail.com>
Subject: hole in e.g. conntrack_ftp  - current status, awareness in frontends?
Date: Sat, 23 Jun 2012 12:07:12 +0100
Message-ID: <4FE5A360.2080107@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=x3ze2QWGDWyWYLrbXzR4nU7rZFJhYEdto/dt03hYI8Q=;
        b=bjHadYg8GpNh0qicumlns4z/LZbYT55RbAeUiIPT3L+K5oyEJPHDHxMafJLd1Cjc+N
         1x8fM/P8/vSWyML8VsI80AE/PCnL6+nhCU8q2OqkvMJzgFGxweO1cfb0OmCq5slGnj/V
         UDHNn9gNRuAYk5Ui6z0TX0cVRfMIIgVTO+cHnPuoJ890k65D68zPfBFlAihJU5sOrDzc
         SWjpAaiYtg4Er2B0+6MPzUQxK4vNwbN8qgzQHWTBxAG03uZ+yYdPHyr1guptKFzV29+k
         A9BPSJIqjKROGoUH2zyC2IbezvmupepFd/vbtDnTQf+i75OheCZAbbSZgiIa65mJO8Cg
         tung==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

  [2010] http://www.theregister.co.uk/2010/01/06/web_based_firewall_attack/
  [2007] 
http://www.linksysinfo.org/index.php?threads/disable-ftp-nat-helper.23156/

The articles I read suggest that -

  1.  Conntrack_ftp lets local users open arbitrary ports.  (To support 
ftp's broken "active" mode).
  2.  It can be triggered by data in connections which aren't really ftp 
(just on the same port).
  3.  It can be triggered by visiting a website.
=> Conntrack_ftp lets user-visited websites bypass what I *thought* my 
firewall rules meant :(

Firefox users should be safe.  By default, Firefox blocks connections to 
port 21, to stop a different attack which has similar consequences.[1]  
(And then there's the uPnP authentication argument.  If you don't 
control your clients, they can always access your firewalled services 
directly, so what's the difference?).  I expect most browsers do 
something similar.

I still worry about it.  There's more than just conntrack_ftp.  
conntrack_irc is also known to be affected.  Firefox's port banning was 
intended to fix a problem with text-based protocols. I don't know that 
conntrack helpers for binary protocols are always strict enough to 
prevent it (or could be).  Then there's FTP urls... other protocols that 
could use server-controlled ports, e.g. from SRV DNS records...  
"Defense in depth" says I just want to disable all the conntrack helpers.

So, that still leaves me with questions.  Maybe this list can help.

1.  Have I missed any updates or limitations that make this *less* worrying?
2.  Am I wrong to worry about it?
3.  Are there any firewall configuration tools that acknowledge this, as 
an issue to worry about?  I've checked three (see below); they seem to 
enable it by default.  All of them let you disable it, but they don't 
document why you might want to do so.

http://www.shorewall.net/FTP.html#Conntrack (what I use now).
http://wiki.openwrt.org/doc/howto/netfilter
ufw

4. Implicit in the above - if I'm right to worry, does the documentation 
for the above tools need improving? (so that everyone will worry about 
it :).


Regards
Alan

[1] http://kb.mozillazine.org/Network.security.ports.banned.override
