From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: performing some analysis over netfilter logs
Date: Mon, 20 May 2013 10:43:11 +0200
Message-ID: <CAOkSjBhWPBjMWVg-EjTKL4NgQe+Q0yf5Z=PEmQiTZ-LuQiWkYA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:mime-version:from:date:message-id:subject:to
         :content-type:content-transfer-encoding;
        bh=ooiFxsrA716ZrW0u7rFWQzfwcyn0I219liMoVO8X+ZI=;
        b=gCWzzts6iw99cf8NT+8NXMujmhJZq9tn/x+zv3YaYl5qrdzAmhuXpz4G0SZxNLyz2m
         dspw+opefLQg37C5Mo7CWbx/BY47cUP9UUUNp2lr8bzzO3MCd2noHkwsZlBVNt09QcxR
         9Gq6ihoA5oYMkA1xeWKhWnGuZcBcJH44cTLfVOU1X2unGtvXQn/EnhXebN/ycPJUQCN4
         8b0t+RXS36f+eqDSHe2JOXKoFQ/KaeIBQcfPw7r15IU1gMpE6UDONomf9aIuFteduaWG
         hjdAJlQy6MKhnPyZ0gqsNC+anKK+0gvKgZbB0yXS4QFbESmJHlvcJKz5VBqWggVmq6m0
         bbLw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

HI there!

I'm wondering how do you face a huge log-generating firewall?.

Some kind of log analizing needs to be done, but I don't know if there
is a standar tool to do it, or maybe not standar but widely used.

I'm looking for a CLI-like tool, written in perl/python/bash to get
most dropped IP, most dropped port, and so on.

Any idea?

Regards
--
Arturo Borrero Gonz=E1lez
