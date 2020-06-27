From: Hooman Mohajeri <mailinglister.hooman@gmail.com>
Subject: Re: WiFi Hotspot Disable Neighbor discovery,Ask
Date: Sat, 27 Jun 2020 19:26:36 -0400
Message-ID: <CAOFdy89VEWJHG02mHf3U1FC3Yi0_3ahkXnjXjR72JOUBx6zpHg@mail.gmail.com>
References: <alpine.DEB.2.21.2006161012410.11442@piplus.local.jubileegroup.co.uk>
 <44cc0842-bd3b-986e-9537-bd11d980e61b@gmail.com> <01ddc95d-b6cd-193c-4a8c-4b2a42718441@gmail.com>
 <8a982f80-e11b-b506-3844-35dc8e655a0a@gmail.com> <alpine.DEB.2.21.2006271231370.13515@piplus.local.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XCjaN4PYzKiBXz3icPe+dHEHNzc8OgtSkl6QCsf9LBg=;
        b=VSedUDfroeLjjLH65VH8ou7T0NEt1BUAK3yURqniRdYL0zpOzfBvWz6oVcGqEps1wH
         IiX5or8N+t5f2ec16E0tZoSOrETCXAo6YDOkIEvAkEnvtkWxVueHiBRaVp3eWEMSSszA
         QcZMZQfaWeeZWptDPKwARXV1cw5Tnu0PtBhk4YIartNDOfw4Vs0omjpBP+VsbReonmZN
         o7ODk7NXy647qMhcmZur+1GrxBkanj29pVo2DZeEMn0tRPYsVnJkeJqQ/1ex9I5XX+Ix
         EjdlikmnX5pLYl12Cngm25zJW9/Rtuh0k9aH4/3zFq3SxIq3aVurZYsBLGYBAL+tSkGJ
         XEpg==
In-Reply-To: <alpine.DEB.2.21.2006271231370.13515@piplus.local.jubileegroup.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Cc: Hooman <netfilter@vger.kernel.org>

As I said, I'll leave it to the netfilter community to decide whether
it's a feature that they want to include or not and how to do it, in
case they decide it's worth adding.

As for the rest of your email and your comment about my mail settings,
it has nothing to do with the question or the content of the thread,
but thanks for your concern and the suggestion!

On Sat, 27 Jun 2020 at 08:04, G.W. Haywood <netfilter@jubileegroup.co.uk> wrote:
>
> Hello again,
>
> On Fri, 26 Jun 2020, Hooman wrote:
>
> > ...
> > not being able to manipulate or drop such packets could be a security
> > issue, since these are packets that you can't really manage through
> > iptables/ebtables (think of firewalls). So I leave it to this community
> > to decide whether netfilter should be able to manage such packets.
> > ...
>
> It is not clear to me that the kernel design permits what you suggest.
>
> Thinking of firewalls, nobody in his right mind would do to a firewall
> what you have done to your computer, and if security is your concern
> you might want to think about that.  You might also want to take steps
> to make your mail look less like it has been carelessly forged - I'm
> sure someone at Princeton will be able to help.  If an envelope sender
> address does not pass our SPF tests the message will not be accepted,
> so you can probably expect in due course to see at least one NDR.
>
> Jun 27 07:47:59 NOQUEUE: connect from mx0a-00005701.pphosted.com [205.220.160.168] ...
> Jun 27 07:48:07 <-- EHLO mx0a-00005701.pphosted.com
> Jun 27 07:48:07        xm_fetch_TXT_records(): [205.220.160.168] No TXT records found for [mx0a-00005701.pphosted.com]
> Jun 27 07:48:07 <-- MAIL From:<mailinglister.hooman@gmail.com> SIZE=18549 BODY=8BITMIME
> Jun 27 07:48:08    xm_spf_query(): [205.220.160.168] SPF RECORD for [mailinglister.hooman@gmail.com] = [v=spf1 redirect=_spf.google.com]
> Jun 27 07:48:10   xm_spf_result(): [205.220.160.168] SPF_SOFTFAIL_WARNING: [softfail (Mechanism '~all' matched)] helo=[mx0a-00005701.pphosted.com] envfrom=[mailinglister.hooman@gmail.com]
> Jun 27 07:48:10 <-- RCPT To:<netfilter@jubileegroup.co.uk>
> Jun 27 07:48:10 <-- DATA
> Jun 27 07:48:12 received[0] [from pps.filterd (m0191391.ppops.net [127.0.0.1]) by mx0a-00005701.pphosted.com (8.16.0.42/8.16.0.42) ...; Fri, 26 Jun 2020 13:07:44 -0500]
> Jun 27 07:48:12 received[1] [from csgsmtp202l.princeton.edu (csgsmtp202l.princeton.edu [140.180.223.155]) by mx0a-00005701.pphosted.com ...; Fri, 26 Jun 2020 13:07:43 -0500]
> Jun 27 07:48:12 received[2] [from [10.42.0.2] (inspire-citp01.princeton.edu [128.112.224.108]) by csgsmtp202l.Princeton.EDU (8.14.4/8.12.9) ...; Fri, 26 Jun 2020 14:07:41 -0400]
> Jun 27 07:48:12 xm_eom_callback(): [205.220.160.168], [AS26211], return [SMFIS_TEMPFAIL], SPF softfail;
> Jun 27 07:48:12 --- 451 4.3.2 Please try again later (held)
> Jun 27 07:48:13 NOQUEUE: connect from mx0a-00005701.pphosted.com [205.220.160.168]
>
> --
>
> 73,
> Ged.
