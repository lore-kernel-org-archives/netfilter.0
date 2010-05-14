From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Change from --syn (old Style) to stat NEW
Date: Fri, 14 May 2010 14:27:10 +0200
Message-ID: <hsjfiu$mri$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

i am thinking about changing much of my firewall rules from the old 
style with the <--syn> argument to the new style with the <-m state 
--state NEW> or to the conntrack style.

For example have a look line 221 to 239 in my firewall 
http://pastebin.com/cG0Vc4EW

These are my FTP rules. Therefore i am only using the <! --syn> 
arguments. Is it useful to remove this argument by inserting <-m 
conntrack ! --cstate NEW> to get more safety ?

regards Markus

