From: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Subject: Re: WiFi Hotspot Disable Neighbor discovery,Ask
Date: Sat, 27 Jun 2020 13:01:08 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2006271231370.13515@piplus.local.jubileegroup.co.uk>
References: <alpine.DEB.2.21.2006161012410.11442@piplus.local.jubileegroup.co.uk> <44cc0842-bd3b-986e-9537-bd11d980e61b@gmail.com> <01ddc95d-b6cd-193c-4a8c-4b2a42718441@gmail.com> <8a982f80-e11b-b506-3844-35dc8e655a0a@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8a982f80-e11b-b506-3844-35dc8e655a0a@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Hooman <netfilter@vger.kernel.org>

Hello again,

On Fri, 26 Jun 2020, Hooman wrote:

> ...
> not being able to manipulate or drop such packets could be a security
> issue, since these are packets that you can't really manage through
> iptables/ebtables (think of firewalls). So I leave it to this community
> to decide whether netfilter should be able to manage such packets.
> ...

It is not clear to me that the kernel design permits what you suggest.

Thinking of firewalls, nobody in his right mind would do to a firewall
what you have done to your computer, and if security is your concern
you might want to think about that.  You might also want to take steps
to make your mail look less like it has been carelessly forged - I'm
sure someone at Princeton will be able to help.  If an envelope sender
address does not pass our SPF tests the message will not be accepted,
so you can probably expect in due course to see at least one NDR.

Jun 27 07:47:59 NOQUEUE: connect from mx0a-00005701.pphosted.com [205.220.160.168] ...
Jun 27 07:48:07 <-- EHLO mx0a-00005701.pphosted.com
Jun 27 07:48:07        xm_fetch_TXT_records(): [205.220.160.168] No TXT records found for [mx0a-00005701.pphosted.com]
Jun 27 07:48:07 <-- MAIL From:<mailinglister.hooman@gmail.com> SIZE=18549 BODY=8BITMIME
Jun 27 07:48:08    xm_spf_query(): [205.220.160.168] SPF RECORD for [mailinglister.hooman@gmail.com] = [v=spf1 redirect=_spf.google.com]
Jun 27 07:48:10   xm_spf_result(): [205.220.160.168] SPF_SOFTFAIL_WARNING: [softfail (Mechanism '~all' matched)] helo=[mx0a-00005701.pphosted.com] envfrom=[mailinglister.hooman@gmail.com]
Jun 27 07:48:10 <-- RCPT To:<netfilter@jubileegroup.co.uk>
Jun 27 07:48:10 <-- DATA
Jun 27 07:48:12 received[0] [from pps.filterd (m0191391.ppops.net [127.0.0.1]) by mx0a-00005701.pphosted.com (8.16.0.42/8.16.0.42) ...; Fri, 26 Jun 2020 13:07:44 -0500]
Jun 27 07:48:12 received[1] [from csgsmtp202l.princeton.edu (csgsmtp202l.princeton.edu [140.180.223.155]) by mx0a-00005701.pphosted.com ...; Fri, 26 Jun 2020 13:07:43 -0500]
Jun 27 07:48:12 received[2] [from [10.42.0.2] (inspire-citp01.princeton.edu [128.112.224.108]) by csgsmtp202l.Princeton.EDU (8.14.4/8.12.9) ...; Fri, 26 Jun 2020 14:07:41 -0400]
Jun 27 07:48:12 xm_eom_callback(): [205.220.160.168], [AS26211], return [SMFIS_TEMPFAIL], SPF softfail;
Jun 27 07:48:12 --- 451 4.3.2 Please try again later (held)
Jun 27 07:48:13 NOQUEUE: connect from mx0a-00005701.pphosted.com [205.220.160.168]

-- 

73,
Ged.
