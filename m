From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Need help have some questions...
Date: 25 Aug 2003 22:57:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1061845024.1507.93.camel@kermit>
References: <20030825203905.32224.qmail@web40207.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030825203905.32224.qmail@web40207.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: SBlaze <dagent.geo@yahoo.com>
Cc: nf <netfilter@lists.netfilter.org>

Am Mon, 2003-08-25 um 22.39 schrieb SBlaze:

> Currently I am using Apache and I have two sites vhosted on it. The only =
sort
> thing I really use my windows box for is web browsing/multimedia that sor=
t...it
> has no services available to the world. So thats whats confusing me is th=
at
> everyone says use a proxy but I don't see how using a proxy can stop thos=
e
> unwanted requests. I'm trying to stop certain requests from reaching my w=
eb
> server which is my router/firewall/web/file server. So how is a proxy sup=
posed
> to help in this case? Everyone says it is but I just don't know much abou=
t
> "proxying" or proxying soloutions for that matter
Oh, that i might not remember your original post correctly. Lets see ...
Well, yeah you are right, you never said you wanted to redirect but just
reject. Ok, my fault.
Then you could just put a proxy in between. Run your Apache on 8080 and
run a reverse proxy like apache or squid on 80. But I doubt, that you
would be happy with it, because it will eat up resources.=20
Make a long thread short:
There is no good way to do it on one machine. Since you are using Apache
and not IIS, you will be fine. If the log messages annoy you, bad luck.
This is just life if you don't filter the request first using a proxy.

Cheers,

Ralf

--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

