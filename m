From: Michael Gale <michael@bluesuperman.com>
Subject: Re: Two DHCP addresses on external interface
Date: Sun, 28 Dec 2003 17:26:39 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031228172639.4c0950c4.michael@bluesuperman.com>
References: <20031228170733.14a6c754.michael@bluesuperman.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031228170733.14a6c754.michael@bluesuperman.com>
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

Hello,

	I think I have the answer, first I will find out the MAC address of my
PS2 (packet sniffer) and then use dhcpcd w/ -I:
--snip-- man dhcpcd
-I <ClientID>
              Specifies the client identifier string.  dhcpcd uses the
default client identifier (MAC address of              the network
interface) if it is not specified.
--snip--

I will specify the MAC of my PS2 ... then I can DNAT the traffic back
and forth to and from the PS2 :)

Oh ... I think it will work :)

Michael.



On Sun, 28 Dec 2003 17:07:33 -0700
Michael Gale <michael@bluesuperman.com> wrote:

> Hello,
> 
> 	I have a strange question, right now I have a firewall box at
> 	home and
> behind it is my web, mail and FTP server.
> 
> Plus the rest of my computers and my wife's PC.
> 
> 
> I got a PS2 for Christmas ... I know I will never grow up really :)
> 
> So I want to play online but it uses strange ports and they do not
> seem to be listed anywhere. Plus I can not host any games if I am
> behind a firewall unless I forward connections on ports about 1024 to
> the PS2 IP which could break FTP and other things.
> 
> So my ISP provides a second IP free of charge :0 so I have them
> provide me with one. So now I can plug two PC's into a HUB and the
> cable modem into the HUB and each PC gets it's own IP via DHCP. 
> 
> I would like to have my firewall get both IP's then I would be able to
> 
> have some control as to what packets go to and from the PC also I can
> do some bandwidth monitoring.
> 
> I have used virtual IP's on linux boxes before with no problems but
> can I have a box get both IP's via DHCP ???
> 
> Right now it gets one:
> /sbin/dhcpcd -t 60 -h CO -d eth0
> 
> I tried to get a second one by:
> /sbin/dhcpcd -t 60 -h CO -d eth0:1 
> 
> But it did not work :(
> 
> .. any ideas ??? do I need to fact another MAC address ???? now I am 
> thinking
> 
> 
> -- 
> Hand over the Slackware CD's and back AWAY from the computer, your
> geek rights have been revoked !!!
> 
> Michael Gale
> Slackware user :)
> Bluesuperman.com 
> 


-- 
Hand over the Slackware CD's and back AWAY from the computer, your geek
rights have been revoked !!!

Michael Gale
Slackware user :)
Bluesuperman.com 

