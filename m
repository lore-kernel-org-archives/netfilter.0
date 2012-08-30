From: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: Adding support for Stateless Static NAT for TAP devices
Date: Thu, 30 Aug 2012 11:43:51 +0100
Message-ID: <CAJSP0QWnZ6Nrf4q6QnU9avkNnEy8d7_CP8pbcU2QQhMJq-eeLg@mail.gmail.com>
References: <7F9A6D26EB51614FBF9F81C0DA4CFEC8026E2BC561E5@il-ex01.ad.checkpoint.com>
	<20120830091416.GD6814@stefanha-thinkpad.localdomain>
	<7F9A6D26EB51614FBF9F81C0DA4CFEC8026E2BC56295@il-ex01.ad.checkpoint.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=zFDRgSj5sNkpbS9T6uN/8hWLLZGmEqeoHkCcw73ead4=;
        b=lsX5WI/Hd9k7ASSIRACo4IWSaew3a3CzKMN6Xcife0dVeyzAthCoqasahEQ/F9aqat
         ZPsFRWH3PbGql929U8S4cYhQHSGMkBrZHX1Ev83sdr95e1ccn6wg615pkS7p+4Zi5JuL
         jmlSN7AcANkC3LOFOmIWXPRo3QyE9RiLSRtOkcLXHOyrtU9uvtNZkZX8hEJfjc+TANTD
         yMeqUXHDls9zw9O5IAZ4AF2EFPXkF8g+JDvmo7Dt5iCZlYp6LLKzZew/4O2uRss43CAz
         LLgWyqOM7Om5mhsWQtO68UjhZ7tPBW0NVrANdcugwHZTgrku/2j8yNRCk+knRyk3AeTA
         D5Fw==
In-Reply-To: <7F9A6D26EB51614FBF9F81C0DA4CFEC8026E2BC56295@il-ex01.ad.checkpoint.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Basila <jbasila@checkpoint.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Anthony Liguori <aliguori@us.ibm.com>, Rusty Russell <rusty@rustcorp.com.au>, netfilter@vger.kernel.org

On Thu, Aug 30, 2012 at 10:27 AM, John Basila <jbasila@checkpoint.com> wrote:
> I have tried NAT and this is why I came up with this feature.

QEMU's net/tap.c is the wrong place to add NAT code.  The point of tap
is to use the host network stack.  If you want userspace networking,
use -netdev user or -netdev socket.

Please look into iptables more.  I have CCed the netfilter mailing
list.  The question is:

The host has several tap interfaces (tap0, tap1, ...) and the machine
on the other end of each tap interface uses IP address 10.0.0.2.  So
we have:

tap0 <-> virtual machine #0 (10.0.0.2)
tap1 <-> virtual machine #1 (10.0.0.2)
tap2 <-> virtual machine #2 (10.0.0.2)

Because the virtual machines all use the same static IP address, they
cannot communicate with each other or the outside world (they fight
over ARP).  We'd like to NAT the tap interfaces:

tap0 <-> virtual machine #0 (10.0.0.2 NAT to 192.168.0.2)
tap1 <-> virtual machine #1 (10.0.0.2 NAT to 192.168.0.3)
tap2 <-> virtual machine #2 (10.0.0.2 NAT to 192.168.0.4)

This would allow the virtual machines to communicate even though each
believes it is 10.0.0.2.

How can this be done using iptables and friends?

Thanks,
Stefan
