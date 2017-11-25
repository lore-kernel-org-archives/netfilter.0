From: Rafael Ganascim <rganascim@gmail.com>
Subject: CGNAT - Deterministic port ranges RFC7422
Date: Sat, 25 Nov 2017 02:41:50 -0200
Message-ID: <CAD4ZOMw-r1iPt4KHL-oN4CGx7FuAZS8dNQz4srqbuJLWrigT7Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=0U41Dn/OO6DJMzDUxWjchXb9d0xF+nYxY4cDi0Bfqvw=;
        b=m2nf0lqZazLVh84Ha7K0tKwG1v41I8neBHeFfRpsgq2+JZamoic1WUA2I2fuSravSl
         4ADEIaWHG+lOzbf9K8kKbzUrNKLoHz27Vg1FvotbMM57gS8QHD2bKqi/YeF1My1wNWQr
         uCKyazndyf4h9PZTSCokWM45nY7RCAGxjePdo508/fQJQTal5RoeBLisUgXIOpytq46P
         UxF4dwuK7e3byxyoDLXgehO7+8DfsrRU1auIDAZomqXIxvLkjwXu2G7cxJ3OlnTOhp8X
         tYOOqA32JQmqTh7h18f+9HJ6v5g3kwsgJ6LR8fPSQgn5PBOXijh8rMXKlcf+BlKweEXB
         CoGA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello guys,

Do you know if its possible to create in few rules the RFC7422
deterministic port ranges with netfilter?

I'm using with iptables generating a lot of rules, one for each
internal ipv4 address/port range/protocol (minimum 3 for each private
ip address).

I'm looking in DNETMAP implementation, but I don't know if it can be
configured to be deterministic based on the source-ip/port.


Regards,

Rafael
