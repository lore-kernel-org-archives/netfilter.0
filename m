From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: icmp messages to spoofed address accepted by -m conntrack --ctstate ESTABLISHED,RELATED
Date: Thu, 18 Mar 2004 22:53:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403182253.47803.Antony@Soft-Solutions.co.uk>
References: <20040318223551.GA1128@salty>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040318223551.GA1128@salty>
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
To: netfilter list <netfilter@lists.netfilter.org>

On Thursday 18 March 2004 10:35 pm, Jim Laurino wrote:

> Hello,
>
> I added a rule with this matching pattern to
> the iptables firewall on my machine.
>
> -m conntrack --ctstate ESTABLISHED,RELATED
>
> I am logging the matches, the only packets matching are icmp destination
> unreachable packets that are responses to -
> a udp packet sent to dest ports 1026 or 1027 that has the source IP of my
> machine.
>
> I have now done parallel tcpdump tracing, (among other tests) and I now
> think the original udp packets do not come from me, but rather that someone
> is spoofing my IP address.

I agree with this latter explanation.

http://isc.incidents.org/port_details.html?port=1026
http://www.mynetwatchman.com/kb/security/articles/popupspam
http://www.lurhq.com/popup_spam.html

Regards,

Antony

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


