From: udo <udovdh@yahoo.com>
Subject: Re: TARPIT question (more info)
Date: Sun, 18 Apr 2004 11:47:09 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040418184709.34452.qmail@web40713.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello,

>> Now I also want to use the tarpit feature for ports
>> 1023. Who can help me here?

> Maybe you can do something with the mport patch :
> http://www.netfilter.org/patch-o-matic/pom-
base.html#pom-base-mport

The issue is more in this direction:
For unpriviliged ports I need to find out if a
connection is related or not.
Do I need conntrack for that? Or=20
If a connection is not wanted I could make it
UNTRACKED and move it to the TARPIT target.

I may be missing something here, of course.

Kind regards,
Udo



=09
	=09
__________________________________
Do you Yahoo!?
Yahoo! Photos: High-quality 4x6 digital prints for 25=A2
http://photos.yahoo.com/ph/print_splash

