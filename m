From: Paul Colclough <paulc@ibiblio.org>
Subject: Re: block kazaa
Date: Wed, 26 Mar 2003 08:14:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030326081140.028671b0@mail.clara.net>
References: <5.2.0.9.0.20030325212147.00ba2e88@mail.clara.net>
 <5.2.0.9.0.20030325212147.00ba2e88@mail.clara.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048656618.6605.13.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: raymondl@knowledgefactory.co.za
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

At 07:30 26/03/2003 +0200, you wrote:
>On Tue, 2003-03-25 at 23:27, paulc@ibiblio.org wrote:
> > The way I block Kazaa (and the other file sharing applications) is a
> > blanket ban on all ports by default. I then open the ports as I think is
> > appropriate at the firewall. These only include the port 23 for anyone
> > wishing to use telnet. All web and ftp style ports on 80, 21 and the like
> > are handled by a web-proxy to prevent using them for other purposes. All
> > incoming connects (and lots of ICMP messages) are dropped by the 
> firewall also.
> >
>How do you get passive ftp to work and not allow file sharing networks?

The firewall machine itself has full access to the internet, and all the 
Windows PC's use a web proxy to accept all web and ftp servers, so the 
firewall machine fetches the file, and passes it on. Therefore the only 
file sharing networks that will work are those that act as a web or ftp 
server on the standard ports.  



