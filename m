From: "John A. Sullivan III" <John.Sullivan@nexusmgmt.com>
Subject: Re: user defined chains
Date: Mon, 12 Jul 2004 15:51:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F2EBB2.7040709@nexusmgmt.com>
References: <f51b72bc040712114970f47399@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <f51b72bc040712114970f47399@mail.gmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Payal Rathod <payalrathod@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Payal Rathod wrote:
> Hi,
> If I want to design a firewall for a network on a high end machine
> with lot of RAM and swap, is there any real use of user defined
> chains? I find them difficult so I would like to use only the built-in
> chains. Is that ok?
> 
> With warm regards,
> -Payal
It may be OK but you will severely limit what you can do.  If your 
security environment is simple, that will be fine.  If it is not, user 
defined chains are a real blessing.  We use them extensively in the ISCS 
project (http://iscs.sourceforge.net) to handle very complicated and 
frequently changing security configurations.  In fact, they are the 
entire key to our access control magic and much of our automated NAT 
configuration.

Again, unless your environment is very simple, it is probably well worth 
your time to become very familiar with user defined chains.  Oskar 
Andreasson has an excellent tutorial in the tutorials section of 
http://www.netfilter.org and there are training slide shows in the 
training section on the ISCS web page.  Good luck - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net

