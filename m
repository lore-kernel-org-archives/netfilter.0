From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 20:34:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920193425.PFHE16609.mta05-svc.ntlworld.com@there>
References: <000701c260d9$871a9070$0801a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000701c260d9$871a9070$0801a8c0@s3ac>
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
To: netfilter@lists.netfilter.org

On Friday 20 September 2002 8:11 pm, Rowan Reid wrote:

> > Rowan Reid wrote:
> > > LOG FILE ###
> > > Sep 20 04:04:01 s3a-www kernel: IN=eth1 OUT=eth1 SRC=192.168.1.105
> > > DST=216.99.233.76 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=61116 DF
> > > PROTO=TCP SPT=4380 DPT=110 WI NDOW=8760 RES=0x00 ACK URGP=0
> >
> > Note that IN and OUT both indicate eth1 -- do you perhaps
> > have both NICs connected to the same hub/switch?
>
> Yes,

Ugh !!!   This is a horrible way to connect a firewall.....    Why ????

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

