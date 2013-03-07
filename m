From: Hamed Afshar <hamed_afshar@yahoo.com>
Subject: question about port forwarding using dnat
Date: Thu, 7 Mar 2013 05:02:13 -0800 (PST)
Message-ID: <1362661333.71899.YahooMailClassic@web142706.mail.bf1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1362661333; bh=SiTH9bD+nYXZrk8FM+8D+Frh7xKwbfZv3Q3MTW4uWF8=; h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Subject:To:MIME-Version:Content-Type; b=YAzO4ke4ajL5msVpBOA1oANjlzFZUE6cyU/v1451MzSlsZ8AjaDB3AbyJsUhFBwUK4FsMZSk74j7RYmzDWJWrm9i9nvWn8TUhY3gM6QAe15Oc7xR7FObzpEfR5+5neWrDsBjam/q21yEHZgQSGjrn9GglBpWeQeC61O9OQ4fID0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I need to manipulate all output requests for an IP range and change the destination port.
For a specific IP, the following rule works for me:

iptables -t nat -A OUTPUT -p tcp -d 1.2.3.4 --dport 22 -j DNAT --to-destination 1.2.3.4:555

which is changing the destination port to 555 on all outgoing requests for port 22 for IP 1.2.3.4.
But I need to apply this to an IP range.
something like this:

iptables -t nat -A OUTPUT -p tcp -d 1.2.3.0/24 --dport 22 -j DNAT --to-destination 1.2.3.0/24:555

to do the following:
1.2.3.1:22 => 1.2.3.1:555
1.2.3.2:22 => 1.2.3.2:555
1.2.3.3:22 => 1.2.3.3:555
etc

iptables accepts IP range with "-d" switch. but as for "--to-destination", it doesn't accept IP range.

Does anyone have any idea how should I do this?

Thanks in advance
Hamed Afshar
