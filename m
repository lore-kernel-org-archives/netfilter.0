From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: NAT, MANGLE, and TOS
Date: Thu, 23 Oct 2003 12:35:35 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E7F@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, nf <netfilter@lists.netfilter.org>


>Good point. Is there any reason I shouldn't put my rules on the mangle=20
>POSTROUTING table and kill 2 birds with one rule?


None that I can see, though I must admit that I swear sometimes I see
packets missing POSTROUGING; though, I blame that on my bogon ray
generator, and not Netfilter itself.


