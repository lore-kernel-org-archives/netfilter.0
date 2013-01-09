From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [ANNOUNCE] ipset 6.16.1 released
Date: Thu, 10 Jan 2013 00:12:39 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301100011360.21351@nerf07.vanv.qr>
References: <alpine.DEB.2.00.1211271510180.15929@blackhole.kfki.hu> <20130109134804.GL31644@workstation> <alpine.DEB.2.00.1301092342440.10144@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1301092342440.10144@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Andreas Herz <andi@geekosphere.org>, netfilter@vger.kernel.org


On Wednesday 2013-01-09 23:44, Jozsef Kadlecsik wrote:
>-			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION)" \
>+			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION)-DINLINE=$(INLINE)" \

You seem to be missing a space before -DINL
