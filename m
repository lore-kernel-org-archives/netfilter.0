From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: full set of rules for samba-related traffic?
Date: Mon, 7 Apr 2003 11:36:56 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0304071135150.14461@dns.toxicfilms.tv>
References: <Pine.LNX.4.44.0304061340240.13388-100000@dell>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304061340240.13388-100000@dell>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

>   is there somewhere a nice summary of all the traffic that
> goes back and forth for all of these activities?  thanks.
I bet there is.
SMB uses 137,138 UDP, 139 TCP.
I think NT also uses 135 TCP
And i think that w2k and samba3 can talk using cifs or some other devilish
protocol on 445 TCP.


Regards,
Maciej


