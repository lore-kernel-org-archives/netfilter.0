From: "Jeremy C. Reed" <reed@reedmedia.net>
Subject: Re: Enabling Samba
Date: Fri, 9 May 2003 10:57:56 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0305091057070.1090-100000@pilchuck.reedmedia.net>
References: <20030509133627.75bc22ca.info@open2web.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030509133627.75bc22ca.info@open2web.com>
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
To: Mark Tessier <info@open2web.com>
Cc: netfilter@lists.netfilter.org

On Fri, 9 May 2003, Mark Tessier wrote:

> iptables -A INPUT -p tcp -m tcp --dport 137 --syn -j ACCEPT
> iptables -A INPUT -p udp -m udp --dport 137 -j ACCEPT
>
> iptables -A INPUT -p tcp -m tcp --dport 138 --syn -j ACCEPT
> iptables -A INPUT -p udp -m udp --dport 138 -j ACCEPT
>
> iptables -A INPUT -p tcp -m tcp --dport 139 --syn -j ACCEPT
> iptables -A INPUT -p udp -m udp --dport 139 -j ACCEPT

What about your OUTPUT (or policy for OUTPUT)?

   Jeremy C. Reed
   http://bsd.reedmedia.net/


