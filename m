From: Shivam Sandbhor <shivam@crowdsec.net>
Subject: How to add overlapping CIDR blocks in a set and have a way delete
 them ?
Date: Mon, 4 Oct 2021 14:45:37 +0530
Message-ID: <CAEOQC3M3qUF-Ds6gGP=9d00uQUE36QzBovDjuvgAnuA8WdxMZg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdsec-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=o/oToqpFZk+C1Jv4J8F0mzx9J7aWr5hkZFq7niI3Z8w=;
        b=sSqpC14IqmuHB+HhEUwEgtFEp+Rw5Z02FY3tiKikcC/VDljOquH9pFDRoTsBN9/7Ht
         iEHng7lTo+110BDLUpjRhG5/kYUVpWhacn0m+QI4qCK5Ae+2OIZb3NqMoCv6FBm6SWnS
         k3QuOdPGULYkYKcDyt1d2ggMm+2TPfE+A/Pdxxqx+8Rz+iKM9Z4g7j/HI6usezWk5H4c
         fkQIHy+9Q259eHC8DtJY9jzVln4383pwjx2KcTF4rk4CW5Qoprlhay9IU47zyYX5aA58
         1JYcZ4YoXs8lgnvxjBKTAGHgVX6GP6toi3EWIHbDLntvPXOiWVkFjI20EzKr86D2CrdG
         c+Dg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

For context, we are detecting nefarious IP ranges/CIDR blocks by
parsing the live logs of various services (eg nginx, apache etc) using
the crowdsec agent. After the agent detects a nefarious IP range, we
want to block the range using nftables. To do this we tried adding IP
range to a nftables set, with appropriate rules in place.

The problem we are facing is when the agent detects IP ranges which
overlap. In such cases, nftables rejects the newer overlapping range.
Even if the previous range is smaller.

We tried using the "auto-merge" flag for the set but it doesn't solve
the problem because only ranges present in the same
transaction/command are auto-merged. Also we want to provide users an
option to delete a range. But this won't be possible if this range was
merged to some other range by nftables.

So how do we add IP ranges in a nftables set which are potentially
overlapping and have a way to delete the originally provided ranges ?
