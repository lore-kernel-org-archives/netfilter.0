From: James <vger_tracker@trackivity.com>
Subject: Lots of initial TCP packets with same sequence number
Date: Mon, 1 Jan 2018 09:09:43 -0500
Message-ID: <75567f3d-ab68-9bfa-aa10-0df52e6e6220@trackivity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

About 24 hours ago, I decided to start logging sequence numbers for the 
TCP "ct state new" packets that I drop in my initial screening rules.

The result appears quite fascinating... and smells quite fishy: just 
about half of these packets have the same (non-zero) sequence number.

The destination ports are mostly 23, trailing off to 22, 2323, and 2222, 
which only further adds to the smell.

1) Is anyone else seeing this?

2) Does anyone know what this is?

Thanks.

-- 

  - James
