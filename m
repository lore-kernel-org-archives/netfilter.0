From: "Olshvang, LevX" <levx.olshvang@intel.com>
Subject: What is the added value of tables comparing to chains ?
Date: Thu, 28 Jul 2011 11:14:53 +0300
Message-ID: <FE06BAB9E17C4742BB3BE97B2D419D8C2D0D069663@hasmsx502.ger.corp.intel.com>
References: <FE06BAB9E17C4742BB3BE97B2D419D8C2D0D00D5C1@hasmsx502.ger.corp.intel.com>
 <alpine.LNX.2.01.1107271446470.3503@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1107271446470.3503@frira.zrqbmnf.qr>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


Hi all, 

I am rather new to netfilter , but during couple of months I gained some experience writing both netfilter and iptables extensions.
Threre is very conceivable reasonal link between hooks in TCP/IP stack and chains.

But I should confess I do not understand what for the tables were invented. Is there any code that in match or target function code paths that takes data from table structures ?




For example I asked in my previous post (see quoted below) why some target which just create some structure for internal use must be associated with nat table ? Why not mangle table ?

I understand that the list may had already discussed the issue, I will be glad for references.  

 


>POST :Why Port trigger of DD-WRT requires nat table to store trigger ?
>The last command inserts rule into nat table, and the trigger 
>implementation code gives an error if a mangle table is used instead. 
>The question is why ?
---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

