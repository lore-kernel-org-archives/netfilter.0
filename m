From: "Akos Szalkai" <szalkai@2fkft.com>
Subject: Re: Weird TCP flags?
Date: Sat, 13 Dec 2003 15:53:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031213145334.GC229@2fkft.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <20031213140043.GB229@2fkft.com> <200312131441.17121.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312131441.17121.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> > Your web server sends a syn-ack response, which the firewall in front of
> > 204.157.6.223 silently drops (since it never saw the first packet of the
> > connection).
> 
> If the firewall never saw the first packet, how did it get to the web server?

You probably misread my mail.

It is not the firewall in front of the webserver, but at the other end,
in front of the (probably spoofed) 204.157.6.223 machine.  It does not
have to see the syn packet, but it will see the syn-ack coming back.

Akos

-- 
Akos Szalkai <szalkai@2f.hu>
IT Consultant, CISA
2F 2000 Szamitastechnikai es Szolgaltato Kft.
Tel: (+36-1)-4887700  Fax: (+36-1)-4887709  WWW: http://www.2f.hu/

