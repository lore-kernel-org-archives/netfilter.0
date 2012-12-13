From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: About cluster deployments.
Date: Thu, 13 Dec 2012 12:12:49 +0100
Message-ID: <20121213111249.GA23251@1984>
References: <CACuyg27siFFNibqe4rZCQnUX0KGatmGscoKyA7ViCi1uGg=drw@mail.gmail.com>
 <E7E899956E6065488DBC6623F76F36A275BF60EA6B@RAMNL-EX02.Ram.nl>
 <CACuyg25y_0DHZumvdLUY0455t+AJeckNkYKmCmZj747C3S1vqg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACuyg25y_0DHZumvdLUY0455t+AJeckNkYKmCmZj747C3S1vqg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Humberto =?iso-8859-1?Q?Juc=E1?= <betolj@gmail.com>
Cc: Arnoud Tijssen <ATijssen@ram.nl>, netfilter@vger.kernel.org

Hi Humberto,

On Tue, Dec 11, 2012 at 07:19:36AM -0300, Humberto Juc=E1 wrote:
> Hi, thanks for response!
>=20
> But I like to known what were your experiences.
>=20
> You already made active/active configurations?
> How you handled the traffic to the two firewalls?
> Worked with multicast arp or port mirroring?

=46or active/active firewalls/gatewyas, you will have to use arptables =
+
the cluster match. The CLUSTERIP target is designed to only work for
backend servers.
