From: "Stuart W. Card" <stu@critical.com>
Subject: RE: Lowest spec processor that netfilter will run on
Date: Fri, 07 Jun 2002 13:38:52 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.1.0.14.0.20020607133448.00ae3b60@pop3.norton.antivirus>
References: <001201c20dd0$314a3260$020aa8c0@matttm9svd8lrh>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPKEIECFAA.stewart.thompson@shaw.ca>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


>----- Original Message -----
>From: "John Crowhurst" <fyremoon@fyremoon.net>
>To: <netfilter@lists.samba.org>
>Sent: Thursday, June 06, 2002 6:47 PM
>Subject: Lowest spec processor that netfilter will run on
>
> > This is a question that has been bugging me, what is the lowest spec
> > processor that netfilter can reliably run on?
> > I'm meaning non-x86 type processor.

We've done 16 mbps routing, with a bunch of special hardware related
processing, on 486SX-25s, so you can drop down pretty low on x86 CPUs,
RAM is more of an issue (and that depends upon how much you pare down
the kernel and daemons).

I think the question may really be, can you run on, for instance, a StrongARM,
with minimal RAM, and a little flash instead of a big hard drive? I'd sure 
like to
know, there are cool network devices that can be made affordable if so...

Stuart W. Card, Chief Scientist & Vice-President, Critical Technologies Inc.
Suite 400 Technology Center, 4th Floor 1001 Broad Street, Utica NY 13501
315-793-0248 x141  FAX -9710  <stu@critical.com>  http://www.critical.com


