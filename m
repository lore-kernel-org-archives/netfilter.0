From: "Huw Dixon" <huwdixon@hotmail.com>
Subject: Time Patch on 1.2.6a
Date: Fri, 13 Dec 2002 23:09:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F81QkQiHR9dIzQZt9KA0000ca21@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi - I'm trying to get the TIME extension patched in to my iptables. I"m 
running 1.2.6a. on RH 7.3. I've went thru the patch-o-matic via the 1.2.6a 
download and via the POM extensions howto documentation but I cant quite 
seem to get things going. At one point I did get to the TIME patch in one of 
my POM attempts. The option shows when I run make menuconfig. I've 
recompiled but when I use the time match in my rules i get the message 
regarding /usr/local/lib/iptables/libipt_time.so file not found. Can someone 
provide me with some ideas on what I may be missing in getting this patch 
applied?

TIA

Huw

_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail


