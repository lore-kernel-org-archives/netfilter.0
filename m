From: "Rio Martin." <rio@martin.mu>
Subject: Re: DNAT question..
Date: Fri, 25 Jul 2003 09:41:05 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307250941.05066.rio@martin.mu>
References: <Pine.LNX.4.44.0307241510310.20694-100000@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0307241510310.20694-100000@localhost>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Thursday 24 July 2003 21:15, you wrote:
> Hi Federico,
> >    I think the problem is in the destination IP address, you have to use
> > the external IP, so i think the rule should be:
> > iptables -t nat -A POSTROUTING -p tcp -s 192.168.1.0/24 -d 211.1.1.10
> >    --dport 80 -j SNAT --to 192.168.1.1
> I don't think that's true in this case. As far as I know, after the
> destination address has been rewritten in PREROUTING, all subsequent hooks
> (FORWARD and POSTROUTING) will see the new destination address, not the
> original. But please correct me if I'm wrong.

Finally I found the answer to my own problem..  (:

# Rules that handles request to local webserver from outside
iptables -t nat -A PREROUTING -p tcp -d 211.1.1.10 --dport 80 -j DNAT --to 
192.168.1.2

# Rules that handles request from local network to local webserver
iptables -t nat -I POSTROUTING -p tcp -s 192.168.1.0/24 -d 192.168.1.2 --dport 
80 -j SNAT --to 211.1.1.10

Enter both rules, thats it ..
From local or outside i tried to surf http://211.1.1.10 and both request 
entered the webserver successfully.

Thanks for everyone helped me specially with " -I POSTROUTING " rules. That 
help much ..

Regards,
Rio Martin.
- 
"When in doubt, tell the truth."
		-- Mark Twain


