From: "Akos Szalkai" <szalkai@2fkft.com>
Subject: Re: Weird TCP flags?
Date: Sat, 13 Dec 2003 15:57:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031213145727.GD229@2fkft.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <20031213140043.GB229@2fkft.com> <200312131441.17121.Antony@Soft-Solutions.co.uk> <200312131450.58938.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312131450.58938.Antony@Soft-Solutions.co.uk>
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

> Sorry - I misread your posting at first - I realise now you were saying that 
> the firewall in front of the spoofed address never saw the first packet, so 
> it drops the second one.

Sorry, probably my writing is not clear enough...

> However, the above log entry is from the firewall in front of the web server - 
> as far as it is concerned, it saw the first packet, and it saw the second 
> packet.   I'm not sure there's an explanation yet for why it decided to drop 
> and log the second packet.

I am afraid now you did not misread my posting.  You simply did not read
the rest of it, because it is in there.  Summary: it drops the
retransmitted syn-acks after 60 secs.

Akos

-- 
Akos Szalkai <szalkai@2f.hu>
IT Consultant, CISA
2F 2000 Szamitastechnikai es Szolgaltato Kft.
Tel: (+36-1)-4887700  Fax: (+36-1)-4887709  WWW: http://www.2f.hu/

