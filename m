From: Marc <Marc-yG4tGvGIC004hcxptnrGZodd74u8MsAO@public.gmane.org>
Subject: RE: Iptables, et al best practices for protecting KVM host sharing
	"hostdev" (ixgbe-vf) interfaces with guests
Date: Sun, 31 Oct 2021 20:00:50 +0000
Message-ID: <bd9c0603b35c43d28dd48dd3f0be783f@f1-outsourcing.eu>
References: <6B834239-0EC5-497F-9E1E-00972F712CF4@redfish-solutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <libvirt-users-bounces-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <6B834239-0EC5-497F-9E1E-00972F712CF4-9z15yex7P+UJvtFkdXX2HpqQE7yCjDx5@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/libvirt-users>, 
	<mailto:libvirt-users-request-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/libvirt-users>
List-Post: <mailto:libvirt-users-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Help: <mailto:libvirt-users-request-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/libvirt-users>,
	<mailto:libvirt-users-request-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org?subject=subscribe>
Sender: libvirt-users-bounces-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Errors-To: libvirt-users-bounces-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
To: Philip Prindeville <philipp_subx-9z15yex7P+UJvtFkdXX2HpqQE7yCjDx5@public.gmane.org>, "netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "libvirt-users-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <libvirt-users-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

> 
> My question is this: what's best practices for making sure that a switch
> VLAN misconfiguration issue, a cabling to the wrong port, etc. doesn't
> compromise the KVM server itself?

Not sure about best practice. But what about using a macvtap. That by default does not allow host communication and only allows the guests connected to the same master to communicate with each other.

> How do I allow my KVM server to *not* be on "external", but some of its
> guests to be, without compromising security?

Do not configure the interface with an ip address on the host, and make sure you do not have daemons binding to 0.0.0.0 on the host.


 

