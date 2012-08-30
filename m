From: Ivan Shmakov <oneingray@gmail.com>
Subject: Re: Adding support for Stateless Static NAT for TAP
	devices
Date: Thu, 30 Aug 2012 18:43:01 +0700
Message-ID: <86393438sa.fsf@gray.siamics.net>
References: <7F9A6D26EB51614FBF9F81C0DA4CFEC8026E2BC561E5@il-ex01.ad.checkpoint.com>
	<20120830091416.GD6814@stefanha-thinkpad.localdomain>
	<7F9A6D26EB51614FBF9F81C0DA4CFEC8026E2BC56295@il-ex01.ad.checkpoint.com>
	<CAJSP0QWnZ6Nrf4q6QnU9avkNnEy8d7_CP8pbcU2QQhMJq-eeLg@mail.gmail.com>
	<7F9A6D26EB51614FBF9F81C0DA4CFEC8026E2BC562D6@il-ex01.ad.checkpoint.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Content-Type: text/plain; charset="utf-8"
To: qemu-devel@nongnu.org
Cc: netfilter@vger.kernel.org

>>>>> John Basila <jbasila@checkpoint.com> writes:

[…]

 > The problem here is related to the fact that QEMU is executed with
 > multiple instances and all instances start from the same snapshot,

	Isn't it possible to resolve such an issue using, e. g., DHCPv6
	or DHCP?  All the QEMU instances will (AIUI) have random MAC
	addresses by default, but a static “instance to MAC” mapping is
	also possible, as is the respective “MAC to IP” mapping.

[…]

-- 
FSF associate member #7257	http://sfd.am-1.org/


