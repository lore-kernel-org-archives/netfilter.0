From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: Filtering Nimda, Code Red and Code Red II
Date: Wed, 11 Sep 2002 16:08:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111608.26999.roy@karlsbakk.net>
References: <Pine.LNX.4.44.0209111237190.32463-100000@dns.toxicfilms.tv> <200209111248.g8BCmAv08513@vulcan.rissington.net> <20020911135903.GT7289@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020911135903.GT7289@cannon.eng.us.uu.net>
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
To: Ramin Alidousti <ramin@cannon.eng.us.uu.net>, Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

> > Folks: don't try looking up the 5th layer of the TCP networking model=
 :-)
>
> What's wrong with his statement? As Maciej said the 5th layer of the IP
> model is the application layer:
>
>                  --------------
>       layer 5   |  application |
>                  --------------
>       layer 4   |  TCP / UDP   |
>                  --------------
>       layer 3   |      IP      |
>                  --------------
>       layer 2   |  data link   |
>                  --------------
>       layer 1   |   physical   |
>                  --------------


You don't have any separate data link and physical layers in the IP model=
, as=20
far as I remember. It's a 4-layer model, and goes something like this

+-------------+
| Application |
+-------------+
| Transport   |
+-------------+
| Network     |
+-------------+
| Physical    |
+-------------+

roy
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


