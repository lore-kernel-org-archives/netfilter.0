From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: ip + mac authentication
Date: Wed, 19 Jan 2005 12:57:23 +0200
Message-ID: <3063e50501190257de42d67@mail.gmail.com>
References: <20050119103603.82231.qmail@web30810.mail.mud.yahoo.com>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050119103603.82231.qmail@web30810.mail.mud.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Linux Query <linux_query@yahoo.com>
Cc: netfilter@lists.netfilter.org

You can make a file with pairs of <ip> <mac> and load it with arp -f ,
or man ethers then you can make firewall rules based on ips only, of
course don;t forget to drop traffic in FORWARD which not match your
clients's source ip.


On Wed, 19 Jan 2005 02:36:03 -0800 (PST), Linux Query
<linux_query@yahoo.com> wrote:
> 
> Hi all!
> 
> I want to ensure that each of my clients can have
> access to the net only with the ip address which is
> specifically assigned to him / her. Is the following
> going to work ?
> 
> iptables -I FORWARD -o externalinterface -s
> xx.xx.xx.xx -m mac --mac-source yy:yy:yy:yy:yy -j
> ACCEPT
> 
> or is it required to be done in some other way ?
> 
> thanks and regards to all,
> jim.
> 
> 
> __________________________________
> Do you Yahoo!?
> The all-new My Yahoo! - Get yours free!
> http://my.yahoo.com
> 
> 


-- 
Bla bla

