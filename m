From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ssh
Date: Wed, 14 Jul 2004 17:07:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407141707.46159.Antony@Soft-Solutions.co.uk>
References: <2E314DE03538984BA5634F12115B3A4E62E89F@email1.mitretek.org> <20040715.005759.28779742.netfilter@gvelo.ddnn.jp>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040715.005759.28779742.netfilter@gvelo.ddnn.jp>
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

On Wednesday 14 July 2004 4:57 pm, Koyama Mituru wrote:

> > Should all incoming ports that relate to a service such as SSH, FTP use
> > -m state --state NEW?
> >
> > What are the security implications (if any) of not using -m state
> > --state NEW?
>
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT
>
> I don't want other packets.

That's a good security attitude.

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


