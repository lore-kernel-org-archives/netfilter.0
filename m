From: "Josh Berry" <josh.berry@linknet-solutions.com>
Subject: Re: Is Linux IPTABLES firewall comparable with license Firewall
Date: Sat, 18 Oct 2003 16:40:02 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1263.192.168.111.123.1066513202.squirrel@mail.linknet-solutions.com>
References: <20031018091807.26000.qmail@web20711.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031018091807.26000.qmail@web20711.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

I don't know if anyone has read the latest Information Security magazine,
but they do a comparison between IPTables and Checkpoint.  To sum up the
article, IPTables has the same functionality and can potentially perform
better if properly setup, however Checkpoint is (obviously) much easier to
manage.  So if you have the technical knowledge to maintain the firewall,
I would go with IPTables.  With IPTables you can also take advantage of
many other add-on's that would cost thousands of dollars to implement
otherwise such as QoS control with tc, full-featured routing with iproute2
and IPS functionality with Snort-Inline.


> Hi,
> I don't know whether this is right list for my
> question.
>
> I am facing basic problem while convincing to users. I
> have implemented IPTABLES firewall on my Linux 8.0
> server. I am frequently asked by users which
> firewall/security measures are taken for my network.
> My competitors use Checkpoint Firewall.
> Can somebody guide me how to convince my users that
> Linux IPTABLES Firewall is technically at par with
> commercial Firewall such as checkpoint.
>
> Also if same security policies are adopted for
> IPTABLES and checkpoint, Is IPTABLES technically at
> par with commercial FIREWALLs?
>
> Thanks
>
>
>
>
> __________________________________
> Do you Yahoo!?
> The New Yahoo! Shopping - with improved product search
> http://shopping.yahoo.com
>
>


Thanks,
Josh Berry, CTO
LinkNet-Solutions
469-831-8543
josh.berry@linknet-solutions.com


