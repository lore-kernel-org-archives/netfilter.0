From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: -f option used with iptables
Date: Tue, 24 Jul 2012 21:03:04 +0530
Message-ID: <CAE1WnGftNjL8q6tejZ8aEAJu9kAOT5gEin-R8LuvxaO1a0b-NA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=ju37Q5vhprEh5aWL+BJG/UW4RTmOx52TVXU6KHQlhe0=;
        b=q7YGbklcIkwbmM3caxRSGhc96nxzl3vrxNpY6Tjkx6cRZLDdPdNPttvQYO+vLYcpjn
         XunoJY0AjiUXYlXnAgJFVqpqg+7TuDHCmYTMhx6rpCycdAvI/fN5LJfwYk6/Wo2xAPl5
         NTNgpK1+1xso4JLC4A9xecrnFHOm5cXyMEzJ4WCFoSDsYV/PptnO9GEZdU+4SsWon86r
         s7UMLEfQkEpr8rnrgir1tVMc4Py8ZltZPanooQLI6RupXfWDSFAq0q2/o4MLZwtNwQOD
         h0QdGZ9msX5a6TGaaGupp3tnR8d64iwBMyWClHuOM9g24EMQvKznPSbi3HRW89OSnxxl
         v88g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,

my objective is to drop all fragmented packets on my system
following rules are used

iptables -A INPUT -f -j DROP
iptables -A OUTPUT -f -j DROP
iptables -A FORWARD -f -j DROP

above rules are not making any effect
For information, there is no connection tracking support on my
kernel.Since i understand that if connection tracking is enabled on
kernel then filtering based on fragmentation won't work, so i have
remeved connection tracking support.

i have disable offloading parameters disabled for NIC card

i am using ping -s 32768 10.2.2.2 for generating fragments

Am i doing something wrong
or is there anything  that is conflicting with these rules

Thanks in advance
