From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: logging mac address
Date: Tue, 15 Jul 2003 13:59:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E359E@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Antonio Paulo Salgado Forster <aforster@br.ibm.com>, netfilter@lists.netfilter.org

I don't recommend it, but I guess it is possible to filter them on the
nat prerouting chain instead if you really must have the MAC address
recorded...

-----Original Message-----
From: Antonio Paulo Salgado Forster [mailto:aforster@br.ibm.com]=20
Sent: Tuesday, July 15, 2003 1:06 PM
To: netfilter@lists.netfilter.org
Subject: logging mac address



Hello all,

      Is there any known way to log the mac address for packets blocked
on
the forward table just like in the input table? I've been searching the
archives and documentations but found nothing so far.

Thanks in advance.

Forster




