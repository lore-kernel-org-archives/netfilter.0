From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Logging source mac address
Date: Mon, 04 Oct 2004 10:16:01 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41616931.7060207@pbl.ca>
References: <415D19210004E96A@vsmtp1.tin.it> (added by postmaster@virgilio.it)
	<1096812880.4477.1.camel@porky>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096812880.4477.1.camel@porky>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Eric Leblond wrote:
> To log source address you need to able to know it. This is not the case
> if you are not directly connected to computer that drop via ethernet.
> Thus this is the case for almost all internet IPs....

Logging the MAC address of the router can also be usefull.  For example, 
if there are two routers on the network (each connected to different 
ISP), it would show from which router packets are arriving (usefull for 
debugging).  It could also show if a station on the local network is 
trying to inject packets into an existing connection (OK, this is really 
a task for IDS tool, but anyhow).

With that in mind, I'd say that logging MAC address for all packtes has 
a value (as long as user is aware of couple of basic principles of 
networking).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

