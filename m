From: "Sood, Ashish" <asood@iPolicyNet.COM>
Subject: Use mode Netfiler
Date: Thu, 19 Feb 2004 16:40:52 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D269C7CBDF116A48982D4DC51F111BE324D493@nsezhpmail01.india.ipolicynet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hi,

I want to extend the netfilter to user mode. I read some literature on
the same which talks about a file netfilter_device.h which defines the =
IOCTL's

ioctl(fd, NFDIOSADDCOND, &a_nfdev_condition);
ioctl(fd, NFDIOSDELCOND, &a_nfdev_condition);

I am unable to find the netfilter_device.h in the source code of linux.

Please can anybody guide me on how to extend the NEtfilter to user =
space.

Thanks,
Ashish

