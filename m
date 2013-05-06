From: Timothy Arceri <t_arceri@yahoo.com.au>
Subject: Simulating router breaking idle TCP connections with IPTABLES
Date: Sun, 5 May 2013 19:13:19 -0700 (PDT)
Message-ID: <1367806399.46023.YahooMailNeo@web163402.mail.gq1.yahoo.com>
References: <51869EE6.5090506@gmail.com>
Reply-To: Timothy Arceri <t_arceri@yahoo.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.au; s=s1024; t=1367806399; bh=DzlrNHnc0rrQz1AeGsd8Vj+5pnnM9A9RRuqJ5D7BTE8=; h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=SNOl2V8wp904xDYBVXZES5LbdL/u4qhJhK1tLV0aG4IBAsIY8bHBHAoLZr9tuOx8fH+AeLEeeEPyZ1lnby2ty93mVb735DlRICVslojdFL8qASt+jI2DQUZPKUM/+O3TX+XRq6TG0TccSGQsIt1m8OZxlEkUWymMf9GZ1cgSkNY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi All,

It seems there are some routers floating around that break idle TCP connections after a specified amount of time. 
For example: "Sonicwall devices have that feature to close established connections when they hit a predefined timeout value
with no data passing through."

This causes some issues with Gnome's Nautilus/GVFS and sftp connections that I'm trying to handle more gracfully. The problem is I dont have a router that has this behaviour so I'm looking for a way to simulate it using iptables on my PC.
I have read the thread about this from 2011 http://www.spinics.net/lists/netfilter/msg51963.html but it looks like a solution wasnt provided as the usecase didnt call for doing what was requested.
I however DO want to break the established TCP connections. Does anyone know how I can do this? I don't mind if I need to edit code and rebuild as this is just for testing perposes so I will be reverting once I'm finished.

Thanks for your time,
Tim

