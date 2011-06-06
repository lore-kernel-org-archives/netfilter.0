From: Clemens Eisserer <linuxhippy@gmail.com>
Subject: [NFLOG] How to determine the connection a packet belongs to?
Date: Mon, 6 Jun 2011 16:26:07 +0200
Message-ID: <BANLkTimnO5UzNvq6SfuWc7osck=QL=HrMw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=/iyTJWybZcDs/eu61eS5kil+RQ2nhBrMe+Re3i1172o=;
        b=wsC00bsAuhY7ALC43kzNzwp+DWg2kadLWkrSNeEPWlj40ehwtcnVrhz7lZutK3vIMU
         SnduYIejCwAe2Yv/w5Z2ylyZ4pwOspUV6j09ftzpZo2cFTiwU/nMKl4lKNImzVyS2MoD
         q7eo3+OiscCr3Ui6wXYJ6fG9+ppnmVOCXPUQM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

We are using ulog2/nflog for logging packets and connections, which
works quite well.

However we haven't found a reliable way to determine which packets
belong to which connection.
There seem to be two distinct IDs for both packets (nflog) as well as
connection IDs issued by conntrack,
is there some correlation between the two IDs?

Or is there any other (maybe even better) way to determine which
logged packet belongs to which connection?

Thank you in advance, Clemens
