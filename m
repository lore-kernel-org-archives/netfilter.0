From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help: Iptables rules
Date: Thu, 15 Jan 2004 21:53:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401152153.23002.Antony@Soft-Solutions.co.uk>
References: <OF487854B5.F9A9C49A-ON88256E1C.006A8AE9-88256E1C.006DA0EC@statsus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF487854B5.F9A9C49A-ON88256E1C.006A8AE9-88256E1C.006DA0EC@statsus.com>
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

On Thursday 15 January 2004 7:57 pm, Minh Cao wrote:

> > 3. You say the above has not worked - how have you tested it?
>
> Yes, I tested
> I used VPN client, which connected to remote side. After connected, the
> password authentication is timeout in 2 minutes.

I really would recommend testing the setup with something a lot simpler than a 
VPN client :)

For example, a web browser, email, ssh, ftp - something which uses fairly 
standard TCP connections, and is likely to work through NAT.

Depending on what sort of VPN you are trying to use, you may have significant 
problems getting it work (but then again you may not - as I say it depends 
what sort of VPN it is).   For example, IPsec ESP (tunnel mode) is not too 
difficult to get working, IPsec AH (transport mode) will not work across NAT.   
PPTP requires a special helper module, and there are other sorts of VPN about 
which I have no idea.

Start with something easy and work your way up to a VPN gradually.

> > 6. Did the machine work as a simple router before you tried adding
> > netfilter rules?
>
> Two NICs are on different subnet. Can I config as a router w/o using
> netfilter ?

Er, yes :)   You really should make sure the machine will route packets 
properly before setting up netfilter, which (basically) blocks things.

It sounds as though you might benefit from reading the standard Linux 
Networking HOWTO befoer tackling Oska Andreassen's netfilter tutorial which I 
recommended to you yesterday.

Regards,

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


