From: "david@hajes.org" <david@hajes.org>
Subject: nft multiple port exception
Date: Sun, 26 Jan 2020 15:01:34 +0100
Message-ID: <88552dfd-377b-c0ac-aaa4-ad7868348758@hajes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1580047296; bh=Z4Z2Qdrnrs1az8vjve7K7uKipdIYsi6luvKUrBDRQ8w=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type;
        b=sQ+NvJ7v1AMcyxIXlq+/fY7fm2ks8wdFQs/qFUa9A6qRXglvQyo4bLiYQASOkfhH9
         n2lvVm5T44NBIL+BXd9zDmZemEuGFUReB3GCv1q7Esav9U960a+uOfp8f/psAFzkfZ
         ETEYSLZkbGIAPvf4NE/39MUxJyKb2ZWkjb8fRIUNufTOvA/6r9g4fOZ0dSEeK9qZf+
         DQGeMFdBNivYMIIM25ESrY3B7D027YzlH+BSK+u/jxzJ/ueZv49GIVSJSwyuBReqWJ
         v/kuHvpukuFbgsl+qEGVpxMaeRQ15Qs7Ij5FOQjbecSB9PHytjel/XFzIDLNplQHBQ
         mEC+lck4rajSg==
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

is it possible to use =! exception statemenet for multiple ports?

ip saddr xxx.xxx.xxx.xxx tcp dport != { 80, 443 } drop


blocking acces to IP except ports 80 and 443

