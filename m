From: Timothy Arceri <t_arceri@yahoo.com.au>
Subject: Re: Simulating router breaking idle TCP connections with IPTABLES
Date: Thu, 9 May 2013 00:46:46 -0700 (PDT)
Message-ID: <1368085606.46753.YahooMailNeo@web163403.mail.gq1.yahoo.com>
References: <51869EE6.5090506@gmail.com>
  <1367806399.46023.YahooMailNeo@web163402.mail.gq1.yahoo.com>
 <16F881F4B142A44DA19CD53978B96C481D714D69@DAGN02C-E6.exg6.exghost.com>
 <1367837936.99912.YahooMailNeo@web163404.mail.gq1.yahoo.com> <16F881F4B142A44DA19CD53978B96C481D7156E8@DAGN02C-E6.exg6.exghost.com>
Reply-To: Timothy Arceri <t_arceri@yahoo.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.au; s=s1024; t=1368085606; bh=dlofaGONvAvrOf8nAeaTFvIYm0VxOXJtnRUiiywLfHI=; h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=IebgKq/cHDPRuEUwJWIvPdrQdURlRJ7laNpspVwOMyr8ju0fou+9WAAwa9tYS7YTq2XABq/Uhk/GMa62sKown9VvJEB9wZhQfIQ5jN6BcRgNmnzo5K05KR/lptNzIOvGjXCfm/FjsW6VpsZ6wzBAlW8cy8ZVDzZVk/oz1TqpfWk=
In-Reply-To: <16F881F4B142A44DA19CD53978B96C481D7156E8@DAGN02C-E6.exg6.exghost.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks Bob, I have been attempting to use the port triggering for sftp i.e ssh connections on port 22 but they dont seem to be getting triggered. Is it likely that the ssh port would be ignored from port triggering on this router?? The router logs do not show anything to indicate that it even attempted port triggering.

Thanks for your help,
Tim



----- Original Message -----
From: Bob Reiber <bob@bkss.net>
To: Timothy Arceri <t_arceri@yahoo.com.au>; "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: 
Sent: Tuesday, 7 May 2013 1:34 AM
Subject: RE: Simulating router breaking idle TCP connections with IPTABLES

Look in port triggering. I think there is a timer setting there where you can specify when to close the tcp port

Bob Reiber
BK Sales and Service
3211 Longfellow Dr
Belmont, CA 94002
Tel: 650 376 1122
Fax: 650 240 4556

-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Timothy Arceri
Sent: Monday, May 6, 2013 3:59 AM
To: netfilter@vger.kernel.org
Subject: Re: Simulating router breaking idle TCP connections with IPTABLES

>Um, what kind of router do you have? Even some of the very basic home routers have tcp timers on them. 


I have a Netgear WNR1000v3. Cant find any settings for tcp timers.
