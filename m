From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: IPTables Filtering traffic before Natting HOW TO?
Date: Thu, 23 Jun 2011 12:10:08 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106231208510.16098@frira.zrqbmnf.qr>
References: <BANLkTim1uqdSWuQwsiJvEuw=cD0Pfi0=Zg@mail.gmail.com> <BANLkTimL5KLG=4dgt-_kXY5Y4QsZOkuH-Q@mail.gmail.com> <BANLkTim5GcaD37uXk=rsUXqyiAnC7KVDHg@mail.gmail.com> <BANLkTimMwFFttGEQtGvbpuOfW0axuk=KLQ@mail.gmail.com>
 <BANLkTikvOnzR43EjJdbd_n16OURKROngpA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTikvOnzR43EjJdbd_n16OURKROngpA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Auro Benas <ebay.omg@gmail.com>
Cc: Oskar Berggren <oskar.berggren@gmail.com>, netfilter@vger.kernel.org

On Thursday 2011-06-23 11:17, Auro Benas wrote:

>Hi Readers,
>thanks you Oskar, so in simple words you are saying that IPTables
>can't do what I have in mind to accive with it.

You can loop traffic through veth, but the larger question is why you 
can't just filter in FORWARD - after all, with -m conntrack you also can 
match against the original addresses.
