From: Pro Gupta <pchemistry.35@gmail.com>
Subject: installing netfilter
Date: Sat, 18 Oct 2014 11:16:48 +0530
Message-ID: <CAOrXFhFQd93-Nk1U64dswMZvLwfwW8oQveYa-g3fRXoyE+Qu_A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=r272CifgR8tddGwRVjZA9vzcOg94s4C0oX19MEEFfy4=;
        b=XguO7p3fr8JR8TLvMQeFL1a/HZXywrb8nt/1/6SlktqaegGFcjx1aVZXp0K8Wk0Izq
         L2rDZnX+cOGRBgs0+jW1DfdHa6V/8MZjwH8QRPE4gANIbFrM7iwaPpO/Bej/qmwQFwJb
         KKTC82qbiofs2Lo5vChSyCwsta9qGyf2vQTKWju0qT2tkWnueJ2TpthvPLYFFsYB+lQp
         0P3iPKhkcHzrHYetSkZ3JPi9pp7+y/z0/noZxZs+/58U0343WHqOktS6xj3KpKxvuMjw
         NhQScYk1lepzubOIxoMh/OfIQY5GKnJk8W9Buz/K0GRMZB2WUPi6Mswc3mTi1QWpRM+2
         1ZCA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I h've installed the userspace and kernel libraries along with nftables.
But during validating using #modprobe nf_tables
got error FATAL:Module nf_tables not found
and also no nft commands are running ...
please help!!!
thnx
