From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: How to limit access to only a few hosts in the internet?
Date: Tue, 3 Dec 2002 10:43:10 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212031043.10800.dharmu@nsecure.net>
References: <000501c29803$7963c260$0200a8c0@ntd.michosa.com>
Reply-To: dharmu@nsecure.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c29803$7963c260$0200a8c0@ntd.michosa.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: federico@michosa.com, netfilter@lists.netfilter.org

For the FORWARD rule you can specify -s source machine to allow only those 
machines which you want to allow.
Regards,
Dharmendra.T
Linux Security Expert
www.nsecure.net
dharmu@nsecure.net

On Saturday 30 November 2002 05:30, Federico Canton wrote:
> Hi, is it possible to open a port in the firewall but limit access to
> only a few hosts natted behind a remote firewall?
>
> For example, I already use these rules to open port 80 and direct
> traffic to my internal web server,
>
> $IPTABLES -A FORWARD -i $INET_IFACE -p tcp -d $WEB_SERVER_IP --dport 80
> -j ACCEPT
> $IPTABLES -t nat -A PREROUTING -p tcp -i $INET_IFACE --dport 80 -j DNAT
> --to-destination $WEB_SERVER
>
> but I don't know what do I need to add to the rules so that only a few
> hosts can go through the firewall.
>
> Initially thought of using "--mac-source", but apparently this would not
> work for hosts located on remote networks since the firewall will only
> see the MAC address of the last router the frame passed through.  Is
> this correct?
>
> I will greatly appreciate any suggestions.
>
> Regards,
>
> federico

-- 


