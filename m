From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: HELP ME PLEASE!!!!!!!!!
Date: Wed, 27 Aug 2003 01:11:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030827011121.0dbd647e.arnt@c2i.net>
References: <002f01c36c0e$ae0e71b0$0221a0c0@DANIEL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002f01c36c0e$ae0e71b0$0221a0c0@DANIEL>
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

On Tue, 26 Aug 2003 15:14:39 -0500, 
"Daniel Arjona" <darjona@transito.gob.pa> wrote in message 
<002f01c36c0e$ae0e71b0$0221a0c0@DANIEL>:

> Hello:
> 
> I tried to configure an iptables firewall, but i can't.  I need
> cofigure this to use FTP, Kazaa, Internet, ICQ and access the IMAP
> server of Netscape with my Netscape Client.
> I'm a Linux newbie.
> Please Help me!!!
> 
> Observations:  iptables firewall, mail server and proxy server are
> installed in the same server. It's not recomended, but i don`t have
> other choice.

..lose the mailserver, or have it fetch mail with fetchmail or somesuch,
you the newbie don't want your box listening for smtp from spammers,
they wanna use your box as a relay.

..you wanna simplify matters around yourself:
http://shorewall.net and http://webmin.com/ .

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


