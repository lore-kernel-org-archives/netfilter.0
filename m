From: "Josh Berry" <josh.berry@linknet-solutions.com>
Subject: Re: Block Kazaa from the internal network
Date: Thu, 16 Oct 2003 08:33:56 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <30513.204.214.145.6.1066311236.squirrel@mail.linknet-solutions.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAA5ydvLCDFokyTKr8TUdasbQEAAAAA@petzetakis-africa.co.za>
    <007a01c393cb$e4156f40$0900a8c0@lowth.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007a01c393cb$e4156f40$0900a8c0@lowth.com>
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
To: Chris Lowth <chris@lowth.com>
Cc: Lohan Spies <l.spies@petzetakis-africa.co.za>, netfilter@lists.netfilter.org

You could use a combination of Snort-Inline:
http://sourceforge.net/projects/snort-inline/

and the rules that Snort has for Kazaa and other P2P stuff.

And you could also use P2Pwall which is a P2P blocking module for
IPTables: http://www.lowth.com/p2pwall/


> Messagehttp://p2pwall.sourceforge.net
>   ----- Original Message -----
>   From: Lohan Spies
>   To: netfilter@lists.netfilter.org
>   Sent: Thursday, October 16, 2003 10:42 AM
>   Subject: Block Kazaa from the internal network
>
>
>   Hi All,
>
>   How can i block ALL Kazaa connections from inside my network?
>
>   Thanks,
>
>   Lohan Spies
>   Systems Administrator CSA / DBA / MCP
>   IQ Business Group
>   Tel: +27 12 521 7309
>   Fax: +27 12 541 3441
>   Cell: +27 83 258 2698
>   l.spies@petzetakis-africa.co.za
>
>
>
>
>
>   CONFIDENTIALITY CAUTION: If you have received this communication in
> error, please note that it is intended for the addressee only, is
> private and confidential and dissemination or copying prohibited. Please
> notify us immediately by e-mail and return the original message. We
> cannot assure that the integrity of this communication has been
> maintained nor that it is free of errors, virus, interception or
> interference. Thank you


Thanks,
Josh Berry, CTO
LinkNet-Solutions
469-831-8543
josh.berry@linknet-solutions.com


